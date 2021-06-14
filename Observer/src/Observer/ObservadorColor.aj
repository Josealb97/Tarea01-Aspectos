package Observer;

import java.io.File;
import java.awt.List;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.Date;


public aspect ObservadorColor {
	    File file = new File("Colores.txt");
	    java.util.Date fecha = new Date();
	    BufferedWriter bw;
	    pointcut update() : call( * Ventana.poner*(..) );
	    after() : update() {
	    	String color;
	    	try {
	    		FileWriter fw = new FileWriter(file,true);
	            BufferedWriter bw = new BufferedWriter(fw);
	            
	            if (!file.exists()) {
	                file.createNewFile();
	            }
	            
	            if (thisJoinPointStaticPart.getSignature().getName().equals("ponerAmarillo")) 
	            {
	            	 color = "Amarillo";
	            	 bw.write("Se cambio de fondo a Amarillo en " + fecha + "\n");
	 
	            }
	            else if (thisJoinPointStaticPart.getSignature().getName().equals("ponerRojo")){
	    	        color = "Rojo";
	    	        bw.write("Se cambio de fondo a Rojo en "+ fecha + "\n");

	    	    }else {
	    	    	
	    	    	color = "Azul";
	    	    	bw.write("Se cambio de fondo a Azul en "+ fecha +"\n");
	    	    }
		            bw.close();
		            System.out.println("Se cambio color a  :"+color);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    File file2 = new File("Registro.txt");
	    pointcut update1() : call( * Ventana.set*(..) );
	    after(): update1(){
	        double contador = 0;
	        try {
	        	if (!file2.exists()) {
	                file2.createNewFile();
	            }
	            ArrayList<String> lineas = (ArrayList<String>) Files.readAllLines(Paths.get("Registro.txt"));
	            for(String linea:lineas){
	                try{
	                    String[] lineaSep = linea.split(":");
	                    contador =Double.parseDouble(lineaSep[1]);
	                    
	                }
	                catch(ArrayIndexOutOfBoundsException e){
	                    
	                }
	            }
	        } catch (IOException ex) {
	            contador = 0;
	            System.out.println(ex);
	        }
	        try(BufferedWriter w = new BufferedWriter(new FileWriter("Registro.txt",false));)
	        {
	        contador = contador +  1;
	        w.write("\nVeces que se cambio el fondo: "+contador);
	        } catch (IOException ex) {
	            System.out.println(ex);
	        }
	    }
	
	}
