# 
# Usage:
#   Build Context: derek-banas/
#

FROM joyzoursky/python-chromedriver:3.8-selenium

RUN pip install pyhtml2pdf

WORKDIR /derek-banas
COPY . .

CMD ["python", "pdf-maker/pdf.py"]