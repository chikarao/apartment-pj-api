# Be sure to restart your server when you modify this file.

# Add new mime types for use in respond_to blocks:
# Mime::Type.register "text/richtext", :rtf
# pdf for prawn gem, ensures rails app knows how to respond to pdf request
Mime::Type.register "application/pdf", :pdf
