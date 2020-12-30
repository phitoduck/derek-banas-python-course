import os
import glob
from pyhtml2pdf import converter

THIS_DIR = dir_path = os.path.dirname(os.path.realpath(__file__))

derek_pdf_in = \
    os.path.join(THIS_DIR, "..", "site", "Section 3: Variables - Data Types - Casting", "Python Tutorial 1", "index.html")
derek_pdf_out = os.path.join(THIS_DIR, "Python Tutorial 1.pdf")

# pdfkit.from_file(website_invitation_path, pdf_path)
# custom_css_search_pattern = os.path.join(THIS_DIR, "..", "site", "stylesheets", "*.css")
# default_css_search_pattern = os.path.join(THIS_DIR, "..", "site", "assets", "stylesheets", "*.css")
# css_files = glob.glob(custom_css_search_pattern) + glob.glob(default_css_search_pattern)

# make the pdf
# TODO font-awesome icons are not working
# pdfkit.from_file(website_invitation_path, pdf_path, css=css_files)

converter.convert("file://" + derek_pdf_in, derek_pdf_out)