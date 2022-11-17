package com.xuuxxi.happyold.dao;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;

import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;
/**
 * file转MultipartFile的时候会用到MockMultipartFile
 * 当你导入spring-test依赖的时候 会跟某些依赖冲突（暂未找到具体是哪个冲突）
 * 解决方法 重写一个类去实现MultipartFile接口
 * 直接用MockMultipartFile的源码
 *
 */
public class MultipartFileDto implements MultipartFile {
    private final String name;

    private String originalFilename;

    private String contentType;

    private final byte[] content;

    /**
     * Create a new MultipartFileDto with the given content.
     * @param name the name of the file
     * @param content the content of the file
     */
    public MultipartFileDto(String name, byte[] content) {
        this(name, "", null, content);
    }

    /**
     * Create a new MultipartFileDto with the given content.
     * @param name the name of the file
     * @param contentStream the content of the file as stream
     * @throws IOException if reading from the stream failed
     */
    public MultipartFileDto(String name, InputStream contentStream) throws IOException {
        this(name, "", null, FileCopyUtils.copyToByteArray(contentStream));
    }

    /**
     * Create a new MultipartFileDto with the given content.
     * @param name the name of the file
     * @param originalFilename the original filename (as on the client's machine)
     * @param contentType the content type (if known)
     * @param content the content of the file
     */
    public MultipartFileDto(String name, String originalFilename, String contentType, byte[] content) {
        this.name = name;
        this.originalFilename = (originalFilename != null ? originalFilename : "");
        this.contentType = contentType;
        this.content = (content != null ? content : new byte[0]);
    }

    /**
     * Create a new MultipartFileDto with the given content.
     * @param name the name of the file
     * @param originalFilename the original filename (as on the client's machine)
     * @param contentType the content type (if known)
     * @param contentStream the content of the file as stream
     * @throws IOException if reading from the stream failed
     */
    public MultipartFileDto(String name, String originalFilename, String contentType, InputStream contentStream)
            throws IOException {

        this(name, originalFilename, contentType, FileCopyUtils.copyToByteArray(contentStream));
    }

    @Override
    public String getName() {
        return this.name;
    }

    @Override
    public String getOriginalFilename() {
        return this.originalFilename;
    }

    @Override
    public String getContentType() {
        return this.contentType;
    }

    @Override
    public boolean isEmpty() {
        return (this.content.length == 0);
    }

    @Override
    public long getSize() {
        return this.content.length;
    }

    @Override
    public byte[] getBytes() throws IOException {
        return this.content;
    }

    @Override
    public InputStream getInputStream() throws IOException {
        return new ByteArrayInputStream(this.content);
    }

    @Override
    public void transferTo(File dest) throws IOException, IllegalStateException {
        FileCopyUtils.copy(this.content, dest);
    }
}
