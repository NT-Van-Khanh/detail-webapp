package pthttm.retail.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pthttm.retail.model.Invoice;
import pthttm.retail.repository.InvoiceRepository;
@Service
public class InvoiceService {
	 @Autowired
	    private InvoiceRepository invoiceRepository;

	    public Invoice saveInvoice(Invoice invoice) {
	        return invoiceRepository.save(invoice);
	    }
}
