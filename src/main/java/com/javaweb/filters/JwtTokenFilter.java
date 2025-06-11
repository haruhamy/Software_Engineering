package com.javaweb.filters;

import com.javaweb.components.JwtTokenUtil;
import com.javaweb.entity.UserEntity;
import org.springframework.data.util.Pair;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.persistence.Column;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
@RequiredArgsConstructor
public class JwtTokenFilter extends OncePerRequestFilter {
    @Value("${prefix}")
    private String apiPrefix;

    private final UserDetailsService userDetailsService;
    private final JwtTokenUtil jwtTokenUtil;

    @Override
    protected void doFilterInternal(@NonNull HttpServletRequest request,
                                    @NonNull HttpServletResponse response,
                                    @NonNull FilterChain filterChain)
            throws ServletException, IOException {
        try {
//            System.out.println(request.getServletPath()+"-"+request.getMethod());
            if(isBypassToken(request)) {
                filterChain.doFilter(request, response); //enable bypass
                return;
            }
            final String authHeader = request.getHeader("Authorization");
            System.out.println(authHeader);
            if (authHeader == null || !authHeader.startsWith("Bearer ")) {
                response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized");
                return;
            }
            final String token = authHeader.substring(7);
            final String userName = jwtTokenUtil.extractUserName(token);
            if (userName != null && SecurityContextHolder.getContext().getAuthentication() == null) {
                UserEntity userDetails = (UserEntity) userDetailsService.loadUserByUsername(userName);
                if(jwtTokenUtil.validateToken(token, userDetails)) {
                    UsernamePasswordAuthenticationToken authenticationToken =
                            new UsernamePasswordAuthenticationToken(userDetails, null,
                                    userDetails.getAuthorities());
                    authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(authenticationToken);
                }
            }
            filterChain.doFilter(request, response); //enable bypass
        }catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_UNAUTHORIZED, "Unauthorized");
        }
    }

    private boolean isBypassToken(@NonNull  HttpServletRequest request) {
        final List<Pair<String, String>> bypassTokens = Arrays.asList(
//                Pair.of("/admin/building-list","GET"),
                Pair.of(String.format("%s/buildings", apiPrefix), "POST"),
                Pair.of(String.format("%s/buildings/{ids}", apiPrefix), "DELETE"),
                Pair.of(String.format("%s/buildings/{buildingId}/staffs", apiPrefix), "GET"),
                Pair.of(String.format("%s/user/%s", apiPrefix, "{id}"), "PUT"),
                Pair.of(String.format("%s/user/change-password/%s", apiPrefix, "{id}"), "PUT"),
                Pair.of(String.format("%s/user/password/%s/reset", apiPrefix, "{id}"), "PUT"),
                Pair.of(String.format("%s/user/profile/%s", apiPrefix, "{username}"), "PUT"),
                Pair.of(String.format("%s/user", apiPrefix), "DELETE"),
                Pair.of(String.format("%s/assigments/building", apiPrefix), "POST"),
                Pair.of(String.format("%s/customers", apiPrefix), "DELETE"),
                Pair.of(String.format("%s/transactions", apiPrefix), "DELETE"),
                Pair.of(String.format("%s/transactions", apiPrefix), "POST")
        );
        for(Pair<String, String> bypassToken: bypassTokens) {
            if (request.getServletPath().contains(bypassToken.getFirst()) &&
                    request.getMethod().equals(bypassToken.getSecond())) {
                return false;
            }
        }
        return true;
    }
}
