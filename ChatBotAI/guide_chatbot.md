1. Tạo 1 file ".env", điền api key của LLM(OpenAI, Gemini, Groq, ...) sử dụng: VD: 'GROQ_API_KEY = "..."'
2. Chạy app.py: 'chainlit run app.py -w', hiện ra 'Your app is available at http://localhost:8000' là thành công
3. Chạy chatbot.html: 'python -m http.server 8080', lên chrome tìm 'http://localhost:8080/chatbot.html'