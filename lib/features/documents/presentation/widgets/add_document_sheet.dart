import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/extensions/context.dart';
import '../../utils/document_mime_util.dart';

typedef AddDocumentSubmit = void Function({
  required String title,
  required String fileName,
  required String mimeType,
  required List<int> bytes,
});

class AddDocumentSheet extends StatefulWidget {
  const AddDocumentSheet({
    required this.onSubmit,
    super.key,
  });

  final AddDocumentSubmit onSubmit;

  @override
  State<AddDocumentSheet> createState() => _AddDocumentSheetState();
}

class _AddDocumentSheetState extends State<AddDocumentSheet> {
  final _titleController = TextEditingController();
  String? _fileName;
  List<int>? _bytes;
  String? _mimeType;
  String? _fileError;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: DocumentMimeUtil.allowedExtensions,
      withData: true,
    );
    if (result == null || result.files.isEmpty) {
      return;
    }
    final file = result.files.single;
    final name = file.name;
    final mime = DocumentMimeUtil.mimeTypeForFileName(name);
    if (mime == null || file.bytes == null) {
      setState(() {
        _fileError = context.l10n.documentErrorTypeNotAllowed;
      });
      return;
    }
    setState(() {
      _fileName = name;
      _bytes = file.bytes;
      _mimeType = mime;
      _fileError = null;
      if (_titleController.text.trim().isEmpty) {
        final base = name.contains('.') ? name.substring(0, name.lastIndexOf('.')) : name;
        _titleController.text = base.length >= 3 ? base : base.padRight(3, '_');
      }
    });
  }

  void _submit() {
    final title = _titleController.text.trim();
    if (title.length < 3) {
      setState(() {
        _fileError = context.l10n.documentErrorValidation;
      });
      return;
    }
    if (_fileName == null || _bytes == null || _mimeType == null) {
      setState(() {
        _fileError = context.l10n.documentsPickFileRequired;
      });
      return;
    }
    widget.onSubmit(
      title: title,
      fileName: _fileName!,
      mimeType: _mimeType!,
      bytes: _bytes!,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Padding(
      padding: EdgeInsets.only(
        left: 24,
        right: 24,
        top: 24,
        bottom: MediaQuery.viewInsetsOf(context).bottom + 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            l10n.documentsAddTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              labelText: l10n.documentsFieldTitle,
            ),
            textInputAction: TextInputAction.done,
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: _pickFile,
            icon: const Icon(Icons.attach_file),
            label: Text(
              _fileName ?? l10n.documentsPickFile,
            ),
          ),
          if (_fileError != null) ...[
            const SizedBox(height: 8),
            Text(
              _fileError!,
              style: TextStyle(color: Theme.of(context).colorScheme.error),
            ),
          ],
          const SizedBox(height: 16),
          FilledButton(
            onPressed: _submit,
            child: Text(l10n.documentsUpload),
          ),
        ],
      ),
    );
  }
}
