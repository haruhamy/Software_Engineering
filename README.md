# Software_Engineering

# 🏠 RealEstatePro - Website Bán Bất Động Sản Tích Hợp Chatbot

**Thành viên thực hiện**:

* Nguyễn Ngọc Hảo
* Nguyễn Thị Lê Na
* Nguyễn Minh Duy
* Bùi Quốc Việt
* Nguyễn Đăng Tùng

## 📌 Mô tả dự án

**RealEstatePro** là một nền tảng web hỗ trợ người dùng tìm kiếm, đăng tin và giao dịch bất động sản một cách thuận tiện và nhanh chóng. Trang web được tích hợp **chatbot thông minh** giúp hỗ trợ tư vấn tự động, trả lời thắc mắc người dùng 24/7.

## ⚙️ Tính năng chính

* 🏡 **Quản lý bất động sản**: Thêm/sửa/xóa và tìm kiếm tin đăng bất động sản (nhà, đất, căn hộ,...).
* 🔍 **Tìm kiếm nâng cao**: Lọc kết quả theo vị trí, giá, loại tài sản, diện tích,...
* 💬 **Chatbot thông minh**:

  * Tư vấn loại bất động sản phù hợp
  * Giải đáp nhanh thông tin cơ bản về quy trình mua bán
* 🧑‍💼 **Tài khoản**: Đăng nhập, quản lý hồ sơ cá nhân
* 📊 **Trang admin**: Quản lý người dùng và bài đăng
* 📱 **Responsive UI**: Giao diện tương thích mọi thiết bị

## 🛠️ Công nghệ sử dụng

* **Frontend**: HTML, CSS, JavaScript, Bootstrap
* **Backend**: Java Spring Boot
* **Database**: MySQL
* **Chatbot**: ChainLit/ Groq API

## 📂 Cấu trúc thư mục

```bash
📁 realestatepro/
├── 📁 frontend/
├── 📁 backend/
│   └── 📁 src/
├── 📁 chatbot/
├── 📄 README.md
└── 📄 docker-compose.yml
```

## 🚀 Cài đặt và chạy thử

1. Clone repository:

   ```bash
   git clone https://github.com/your-team/realestatepro.git
   ```

2. Chạy backend:

   ```bash
   cd backend
   ./mvnw spring-boot:run
   ```

3. Chạy frontend:

   ```bash
   cd frontend
   live-server
   ```

4. Tích hợp chatbot (ví dụ dùng Dialogflow webhook hoặc khởi động server Rasa)

## 🧪 Tài khoản demo


* **Tài khoản quản trị**:

  * Tên đăng nhập: nguyenvana
  * Mật khẩu: 123456

* **Tài khoản nhân viên**:

  * Tên đăng nhập: nguyenvanb 
  * Mật khẩu: admin123

## 📌 Ghi chú

* Hệ thống có thể mở rộng để tích hợp bản đồ, định giá tài sản AI, và CRM cho nhân viên sale.
*  Chatbot đang ở giai đoạn thử nghiệm, nhóm sẽ tiếp tục huấn luyện để cải thiện độ chính xác.

## 📧 Liên hệ nhóm

* Email: [22010511@st.phenikaa-uni.edu.vn](mailto:22010511@st.phenikaa-uni.edu.vn)
* Giảng viên hướng dẫn: Trịnh Thanh Bình
