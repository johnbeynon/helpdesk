
CKEDITOR.config.toolbar = [
  { name: 'document', groups: [ 'mode', 'document', 'doctools' ], items: [ 'Source', '-', 'Save', 'NewPage', 'Preview', 'Print', '-', 'Templates' ] },
  { name: 'clipboard', groups: [ 'clipboard', 'undo' ], items: [ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo' ] },
  { name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ], items: [ 'Find', 'Replace', '-', 'SelectAll', '-', 'Scayt' ] },
  { name: 'forms', items: [ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select', 'Button', 'ImageButton', 'HiddenField' ] },
  '/',
  { name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ], items: [ 'Bold', 'Italic', 'Underline', 'Strike', 'Subscript', 'Superscript', '-', 'RemoveFormat' ] },
  { name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align', 'bidi' ], items: [ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', '-', 'Blockquote', 'CreateDiv', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock', '-', 'BidiLtr', 'BidiRtl', 'Language' ] },
  { name: 'links', items: [ 'Link', 'Unlink', 'Anchor' ] },
  { name: 'insert', items: [ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley', 'SpecialChar', 'PageBreak', 'Iframe' ] },
  '/',
  { name: 'styles', items: [ 'Format', 'Font', 'FontSize' ] },
  { name: 'colors', items: [ 'TextColor'] },
  { name: 'tools', items: [ 'Maximize', 'ShowBlocks' ] },
  { name: 'others', items: [ '-' ] },
  { name: 'about', items: [ 'About' ] }
];

CKEDITOR.config.allowedContent = true;
CKEDITOR.config.contentsCss = '/assets/helpdesk/application.css';
/* Filebrowser routes */
// The location of an external file browser, that should be launched when "Browse Server" button is pressed.
CKEDITOR.config.filebrowserBrowseUrl = "/ckeditor/attachment_files";

// The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
CKEDITOR.config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";

// The location of a script that handles file uploads in the Flash dialog.
CKEDITOR.config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";

// The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog
CKEDITOR.config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";

// The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
CKEDITOR.config.filebrowserImageBrowseUrl = "/ckeditor/pictures";

// The location of a script that handles file uploads in the Image dialog.
CKEDITOR.config.filebrowserImageUploadUrl = "/ckeditor/pictures";

// The location of a script that handles file uploads.
CKEDITOR.config.filebrowserUploadUrl = "/ckeditor/attachment_files";

CKEDITOR.config.toolbarGroups = [
{ name: 'document', groups: [ 'mode', 'document', 'doctools' ] },
{ name: 'clipboard', groups: [ 'clipboard', 'undo' ] },
//{ name: 'editing', groups: [ 'find', 'selection', 'spellchecker' ] },
{ name: 'tools' },
{ name: 'about' },
'/',
{ name: 'basicstyles', groups: [ 'basicstyles', 'cleanup' ] },
{ name: 'paragraph', groups: [ 'list', 'indent', 'blocks', 'align' ] }, // , 'bidi'
//{ name: 'forms' },
'/',
{ name: 'styles' },
{ name: 'colors' },
{ name: 'links' },
{ name: 'insert' },
{ name: 'others' }
];

