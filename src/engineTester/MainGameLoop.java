package engineTester;

import models.TexturedModel;
import org.lwjgl.opengl.Display;
import renderEngine.DisplayManager;
import renderEngine.Loader;
import models.RawModel;
import renderEngine.Renderer;
import shaders.StaticShader;
import textures.ModelTexture;

public class MainGameLoop {

    public static void main(String[] args){

        DisplayManager.createDisplay();

        Loader loader = new Loader();
        Renderer renderer = new Renderer();

        StaticShader shader = new StaticShader();


        float[] vertices = {
                -0.5f, 0.5f, 0f,        //V0
                -0.5f, -0.5f, 0f,       //V1
                0.5f, -0.5f, 0f,        //V2
                0.5f, 0.5f, 0f,         //V3
        };

        int[] indices = {
                0,1,3,  //top left triangle
                3,1,2   //bottom right triangle
        };

        float[] textureCoords = {
                0,0,
                0,1,
                1,1,
                1,0
        };

        RawModel model = loader.loadToVAO(vertices, textureCoords, indices);
        ModelTexture texture = new ModelTexture(loader.loadTexture("drag"));
        TexturedModel texturedModel = new TexturedModel(model,texture);


        while(!Display.isCloseRequested()){
            renderer.prepare();
            shader.start();
            //game logic
            renderer.render(texturedModel);
            shader.stop();
            DisplayManager.updateDisplay();
        }

        shader.cleanUp();
        loader.cleanUp();
        DisplayManager.closeDisplay();

    }

}
