import 'package:domain/domain.dart';

class InvoiceUseCase {
  final InvoiceRepository _invoiceRepository;

  InvoiceUseCase({
    required InvoiceRepository invoiceRepository,
  }) : _invoiceRepository = invoiceRepository;

  Future<List<Invoice>> createInvoice(String id) async {
    return _invoiceRepository.getInvoiceHistory(id);
  }

  Future<List<Invoice>> getInvoiceHistory(String id) async {
    return _invoiceRepository.getInvoiceHistory(id);
  }

  Future<Invoice> finishInvoice(String id, bool approve) async {
    return _invoiceRepository.finishInvoice(id, approve);
  }
}
