package vn.beginner.laptopshop.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.*;

@Entity
@Data//toString
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="products")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @NotNull
    @Size(min = 5, message = "Tên phải phải > hơn 5 ký tự")
    private String name;

    @NotNull
    @Min(value = 1, message = "giá phải lớn hớn 1 ")
    private double price;
    private String image;

    @NotNull
    @Size(min = 5, message = "Mô tả phải phải > hơn 5 ký tự")
    @Column(columnDefinition = "MEDIUMTEXT") // đổi thành mediumtext thây vì varchar gioi hạn 255 kí tự
    private String detailDesc;

    @NotNull
    @Size(min = 5, message = "Mô tả ngắn phải phải > hơn 5 ký tự")
    private String shortDesc;

    @NotNull
    @Min(value = 1, message = "số lượng phải lớn hớn 1 ")
    private long quantity;
    private long sold;

    private String factory;
    private String target;
}
