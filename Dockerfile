# Sử dụng một image Node.js chính thức từ Docker Hub
FROM node:14

# Tạo và chuyển sang thư mục /app
WORKDIR /app

# Sao chép file package.json và package-lock.json vào thư mục /app
COPY package*.json ./

# Cài đặt các dependencies được định nghĩa trong package.json
RUN npm install

# Sao chép toàn bộ mã nguồn của ứng dụng vào thư mục /app
COPY . .

# Mở cổng mà ứng dụng sẽ chạy
EXPOSE 3000

# Khởi động ứng dụng bằng nodemon 
CMD ["npx", "nodemon", "app.js"]
