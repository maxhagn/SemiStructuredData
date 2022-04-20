package ssd;

import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

/**
 * TODO: Implement this content handler.
 */
public class ArtHandler extends DefaultHandler {
	/**
	 * Use this xPath variable to create xPath expression that can be
	 * evaluated over the XML document.
	 */
	private static XPath xPath = XPathFactory.newInstance().newXPath();
	
	/**
	 * Store and manipulate the art XML document here.
	 */
	private Document artDoc;
	
	/**
	 * This variable stores the text content of XML Elements.
	 */
	private String eleText;

	/**
	 * Insert local variables here
	 */
	
    
	
    public ArtHandler(Document doc) {
    	artDoc = doc;
    }
    
    @Override
    /**
     * SAX calls this method to pass in character data
     */
  	public void characters(char[] text, int start, int length)
  			    throws SAXException {
  		eleText = new String(text, start, length);
  	}

    /**
     * 
     * Return the current stored art document
     * 
     * @return XML Document
     */
	public Document getDocument() {
		return artDoc;
	}
    
    //***TODO***
	//Specify additional methods to parse the exhibition document and modify the artDoc
   
	
}

