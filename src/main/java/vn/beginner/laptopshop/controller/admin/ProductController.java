package vn.beginner.laptopshop.controller.admin;

import jakarta.validation.Valid;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import vn.beginner.laptopshop.domain.Product;
import vn.beginner.laptopshop.domain.User;
import vn.beginner.laptopshop.service.ProductService;
import vn.beginner.laptopshop.service.UploadService;

import java.util.List;

@Controller
public class ProductController {

    private final UploadService uploadService;
    private final ProductService productService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @RequestMapping(value = "/admin/product", method = RequestMethod.GET)
    public String productPage(Model model, @RequestParam(value = "page", defaultValue = "1") String pageStr) {
        int page = 1;
        try {
            page = Integer.parseInt(pageStr);
        } catch (NumberFormatException e) {
            page = 1;
        }

        if (page < 1) {
            page = 1;
        }

        int pageSize = 5;
        Pageable pageable = PageRequest.of(page - 1, pageSize);

        Page<Product> pr = this.productService.getAllProducts(pageable);

        List<Product> listProduct = pr.getContent();

        model.addAttribute("products", listProduct);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", pr.getTotalPages());

        return "admin/product/show-product";
    }



    @RequestMapping(value = "/admin/product/create", method = RequestMethod.GET)
    public String createProductPage(Model model){
        model.addAttribute("newProduct",new Product());
        return "admin/product/create-product";
    }

    @RequestMapping(value = "/admin/product/create",method = RequestMethod.POST)
    public String createProduct(@ModelAttribute("newProduct") @Valid Product product,
                                BindingResult bindingResult,
                                @RequestParam("hoidanitFile") MultipartFile file)
    {
        List<FieldError> errors = bindingResult.getFieldErrors();
        for (FieldError error : errors ) {
            System.out.println (error.getField() + " - " + error.getDefaultMessage());
        }

        if(bindingResult.hasErrors())
        {
            return "/admin/product/create-product";
        }

        String productImage = this.uploadService.handleSavaUploadFile(file,"product");
        product.setImage(productImage);
        this.productService.CreateProduct(product);
        return "redirect:/admin/product";
    }

    @RequestMapping(value = "/admin/product/view/{id}",method=RequestMethod.GET)
    public String getProductDetailPage(Model model, @PathVariable long id)
    {
        Product product = productService.getProductById(id);
        model.addAttribute("product", product);
        return "admin/product/detail-product";
    }

    @RequestMapping(value = "/admin/product/update/{id}", method = RequestMethod.GET)
    public String updateProductPage(Model model, @PathVariable long id)
    {
        Product product = this.productService.getProductById(id);
        model.addAttribute("newProduct", product);
        return "admin/product/update-product";
    }

    @RequestMapping(value = "/admin/product/update",method = RequestMethod.POST)
    public String updateProduct(@ModelAttribute("newProduct") Product product, @RequestParam("hoidanitFile") MultipartFile file)
    {
        Product currentproduct = this.productService.getProductById(product.getId());
        if(currentproduct!=null)
        {
            currentproduct.setName(product.getName());
            currentproduct.setPrice(product.getPrice());
            currentproduct.setDetailDesc(product.getDetailDesc());
            currentproduct.setShortDesc(product.getShortDesc());
            currentproduct.setQuantity(product.getQuantity());
            currentproduct.setFactory(product.getFactory());
            currentproduct.setTarget(product.getTarget());
            currentproduct.setSold(product.getSold());
            if (!file.isEmpty()) {
                String productImage = this.uploadService.handleSavaUploadFile(file,"product");
                currentproduct.setImage(productImage);
            }
        }

        this.productService.CreateProduct(currentproduct);

        return "redirect:/admin/product";
    }

    @RequestMapping(value = "/admin/product/delete/{id}", method = RequestMethod.GET)
    public String deleteProduct(@PathVariable long id)
    {
        this.productService.deleteProduct(id);
        return "redirect:/admin/product";
    }


}
