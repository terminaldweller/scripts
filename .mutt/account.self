# vim: filetype=neomuttrc

unmailboxes *
set from = 'devi@terminaldweller.com'
set imap_user = 'devi@terminaldweller.com'
source "gpg -d ~/scripts/mail.self.pass.gpg |"
set smtp_url = 'smtp://devi@terminaldweller.com@mail.terminaldweller.com:587'
set realname = 'farzad sadeghi'
set folder = 'imaps://mail.terminaldweller.com:993'
set spoolfile = '+INBOX'
set postponed = '+Drafts'
set record = '+Sent'
set trash = '+Trash'
set header_cache = ~/.mutt/self/cache/headers
set message_cachedir = ~/.mutt/self/cache/bodies
set certificate_file = ~/.mutt/self/certificates
# mailboxes "+INBOX" "+Drafts" "+Sent" "+Trash"
mailboxes "+INBOX" "+INBOX/Github" "+INBOX/Linkedin"
