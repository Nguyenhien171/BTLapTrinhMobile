1. Thế nào là nullable?
Nullable (có thể null) là một tính năng trong lập trình cho phép một biến, thường là kiểu giá trị (như số, ngày tháng), có thể nhận thêm giá trị đặc biệt null (không có giá trị, giá trị bị thiếu) bên cạnh các giá trị hợp lệ thông thường của nó, mang lại sự linh hoạt khi xử lý dữ liệu không xác định hoặc thiếu. Nó giúp phân biệt rõ ràng giữa một giá trị bằng 0 hoặc rỗng với việc thiếu hoàn toàn một giá trị. 
Các đặc điểm chính:
- Cho phép giá trị null: Biến nullable có thể chứa giá trị thực tế (ví dụ: 5, "hello") hoặc null (không có gì).
- Áp dụng cho kiểu giá trị: Thường được dùng cho các kiểu dữ liệu nguyên thủy (value types) như int, bool, double, để chúng có thể nhận null, điều mà chúng không thể làm được theo mặc định.
- Có thuộc tính kiểm tra: Các kiểu nullable thường có các thuộc tính như HasValue (kiểm tra biến có giá trị hay không) và Value (lấy giá trị), truy cập các tài liệu về C#.
- Dùng trong cơ sở dữ liệu: Rất quan trọng trong cơ sở dữ liệu (SQL) để biểu thị các trường dữ liệu bị thiếu hoặc không có thông tin. 

2. Khi nào nên/không nên dùng nullable?
- Nên dùng Nullable khi giá trị của biến thực sự có trạng thái "không tồn tại" hoặc "chưa xác định".
Dữ liệu tùy chọn (Optional Data): Khi người dùng điền form, những ô không bắt buộc (như "Số điện thoại bàn" hoặc "Ghi chú") nên được để là Nullable.
Kết quả tìm kiếm không thấy: Nếu bạn có một hàm findUserById(id) và không có user nào khớp với ID đó, trả về null là cách hợp lý nhất để báo hiệu "không tìm thấy".
Tương tác với Database: Hầu hết các DB cho phép cột chứa giá trị NULL. Để đồng bộ hóa dữ liệu giữa mã nguồn và DB bạn cần dùng kiểu Nullable.
Trạng thái khởi tạo: Khi một đối tượng mới được tạo ra nhưng một số thuộc tính của nó cần thời gian để tải hoặc tính toán sau, có thể để chúng là null lúc ban đầu.

- Không nên lạm dụng Nullable sẽ khiến code trở nên rắc rối vì lúc nào cũng phải viết câu lệnh if (x != null). Nên tránh dùng nó trong các trường hợp:
Tham số bắt buộc: Nếu một hàm không thể chạy nếu thiếu dữ liệu (ví dụ: hàm tinh_luong(nhan_vien)), thì tham số nhan_vien tuyệt đối không được là Nullable.
Giá trị mặc định có ý nghĩa: Nếu bạn có thể thay null bằng một giá trị mặc định an toàn, hãy làm thế.
Ví dụ: Thay vì dùng List? (có thể null), hãy dùng một danh sách rỗng []. Danh sách rỗng vẫn có thể chạy vòng lặp mà không gây lỗi, còn null thì không.
Biến số học cơ bản trong tính toán: Các biến dùng để cộng trừ nhân chia nên có giá trị khởi tạo (như 0) thay vì null để tránh lỗi tính toán.
Các hằng số hoặc cấu hình hệ thống: Những giá trị mà hệ thống buộc phải có để khởi động.

3. Cách xử lí null phổ biến như: ?, ?., ?:, let, !!
    1) Toán tử Safe Call (?.)
Thay vì kiểm tra if (obj != null), dùng ?.. Nếu đối tượng là null, nó sẽ dừng lại và trả về null luôn chứ không gây lỗi crash.
Cách dùng: student?.name
Ý nghĩa: "Nếu student không null thì lấy name, nếu student null thì kết quả cả cụm đó là null."

    2) Toán tử Elvis / Null Coalescing (?: hoặc ??)
Toán tử này dùng để cung cấp một giá trị mặc định khi biến bị null.
Cách dùng: val name = inputName ?: "Anonymous"
Ý nghĩa: "Nếu inputName có giá trị thì lấy nó, nếu inputName là null thì lấy chữ 'Anonymous'."
    3) Toán tử Not-null Assertion (!!)
Đây là cách "ép" chương trình tin rằng biến này chắc chắn không null.
Cách dùng: user!!.id
Ý nghĩa: "Tôi cam đoan user không thể null, hãy chạy đi!".
Cảnh báo: Nếu thực tế lúc đó user bị null, chương trình sẽ crash lập tức. Chỉ nên dùng khi cực kỳ chắc chắn hoặc trong unit test.

    4) Hàm Scoping (let)
Thường thấy trong Kotlin hoặc các ngôn ngữ có hàm nâng cao. Nó giúp bạn thực thi một đoạn code chỉ khi biến đó không null.
Cách dùng: user?.let {
    // Chỉ chạy đoạn này nếu user khác null
    println(it.name)
    saveToDatabase(it)
}
Ý nghĩa: Nó gom nhóm các hành động cần làm với một biến "không null" vào trong một khối lệnh gọn gàng.

    5) Khai báo kiểu Nullable (?)
Đây là bước đặt nền móng ngay từ khi khai báo biến.
Cách dùng: String? name
Ý nghĩa: Dấu ? đặt sau kiểu dữ liệu thông báo cho trình biên dịch rằng: "Biến này có thể chứa một chuỗi hoặc chứa null". Nếu không có dấu ?, sẽ không được phép gán null cho nó.