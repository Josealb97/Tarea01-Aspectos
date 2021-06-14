package Observer;


import java.util.ArrayList;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.layout.Pane;
import javafx.scene.layout.VBox;

public class Ventana{
	
	
	private String color;
	
	private Stage stage;
	private Button btnAmarillo,btnRojo,btnAzul;
    private VBox botones;
    private Pane root;
    private Scene scene;
    
    
	public Ventana(Stage stage) {
		
		
		
		this.stage=stage;
		btnAmarillo = new Button("Amarillo");
		btnAmarillo.setPrefSize(150, 50);
		btnAmarillo.setOnMouseClicked((e) -> ponerAmarillo());
		
		btnRojo = new Button("Rojo");
		btnRojo.setPrefSize(150, 50);
		btnRojo.setOnMouseClicked((e) -> ponerRojo());
		
		btnAzul = new Button("Azul");
		btnAzul.setPrefSize(150, 50);
		btnAzul.setOnMouseClicked((e) -> ponerAzul());
		
		root = new Pane();
		scene = new Scene(root,400,400);
		botones = new VBox(btnAmarillo, btnRojo,btnAzul);
		botones.setSpacing(25);
		
		root.getChildren().add(botones);
		botones.setLayoutX(125);
        botones.setLayoutY(100);
		
		stage.setScene(scene);
		stage.show();
	}
	
	private void ponerAmarillo() {
		root.setStyle("-fx-background-color:Yellow");
		setColor("Amarillo");
	}
	
	private void ponerRojo() {
		root.setStyle("-fx-background-color:Red");
		setColor("Rojo");
	}
	
	private void ponerAzul() {
		root.setStyle("-fx-background-color:Blue");
		setColor("Azul");
	}
	
	public void setColor(String color) {
		this.color=color;

	}
	
	public String getColor() {
		return color;
	}
	
}