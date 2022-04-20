package ssd;

import java.io.File;
import java.io.FileInputStream;
import java.net.URL;
import java.util.List;

import javax.xml.XMLConstants;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import javax.xml.validation.Schema;
import javax.xml.validation.SchemaFactory;
import javax.xml.validation.Validator;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.Document;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;
import org.xml.sax.helpers.XMLReaderFactory;


public class SSD {
    private static DocumentBuilderFactory documentBuilderFactory;
    private static DocumentBuilder documentBuilder;

	public static void main(String[] args) throws Exception {
		if (args.length != 3) {
            System.err.println("Usage: java SSD <input.xml> <exhibition.xml> <output.xml>");
            System.exit(1);
        }
	
		String inputPath = args[0];
		String exhibitionPath = args[1];
		String outputPath = args[2];
		
    
       initialize();
       transform(inputPath, exhibitionPath, outputPath);
    }
	
	private static void initialize() throws Exception {    
       documentBuilderFactory = DocumentBuilderFactory.newInstance();
       documentBuilderFactory.setNamespaceAware(true);
       documentBuilder = documentBuilderFactory.newDocumentBuilder();
    }
	
	/**
     * Use this method to encapsulate the main logic for this example. 
     * 
     * First read in the art document. 
     * Second create a ArtHandler and an XMLReader (SAX parser)
     * Third parse the exhibition document
     * Last get the Document from the ArtHandler and use a
     *    Transformer to print the document to the output path.
     * 
     * @param inputPath Path to the xml file to get read in.
     * @param exhibitionPath Path to the exhibition xml file
     * @param outputPath Path to the output xml file.
     */
    private static void transform(String inputPath, String exhibitionPath, String outputPath) throws Exception {
        // Read in the data from the art xml document, created in example 1
    	
    	
        
        
        // Create an input source for the exhibition document


		

        // start the actual parsing
        
	   
        
       
        // Validate file before storing        
			
		
		
		
        
        
        // get the document from the ArtHandler
        
		
		
		
        
        //validate
        
		
		
		
		
        
        //store the document
        
		
		
		
		
    }

    /**
     * Prints an error message and exits with return code 1
     * 
     * @param message The error message to be printed
     */
    public static void exit(String message) {
    	System.err.println(message);
    	System.exit(1);
    }
    

}
