package pthttm.retail.repository.firebase;

import java.io.IOException;
import java.io.InputStream;

public interface FirebaseRepository {
    InputStream getObject(String bucketName, String fileName) throws IOException;
    String getObjectUrl(String bucketName, String fileName) throws IOException;
    void uploadObject(String bucketName, String fileName, InputStream inputStream,String contentType) throws IOException;
    void deleteObject(String bucketName, String fileName) throws IOException;
}
