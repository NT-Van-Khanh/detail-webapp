package pthttm.retail.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pthttm.retail.model.Invoice;
@Repository
public interface InvoiceRepository extends JpaRepository<Invoice, Long>{

}
