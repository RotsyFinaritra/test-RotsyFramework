package com.test;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import com.etu003184.annotation.Controller;
import com.etu003184.annotation.GetMapping;
import com.etu003184.annotation.Json;
import com.etu003184.annotation.PostMapping;
import com.etu003184.model.ModelView;
import com.etu003184.model.UploadedFile;
import com.etu003184.util.FileUploadUtil;

@Controller
public class UploadController {

    @GetMapping("/upload/form1")
    public ModelView uploadForm1() {
        return new ModelView("form-upload.jsp");
    }

    @GetMapping("/upload/form2")
    public ModelView uploadForm2() {
        return new ModelView("form-upload-multiple.jsp");
    }

    @PostMapping("/upload")
    public ModelView uploadFile(String title, UploadedFile file) {
        ModelView mv = new ModelView("result.jsp");

        try {
            if (file != null && !file.isEmpty()) {
                // Le fichier est déjà stocké dans /tmp/upload_xxx.ext
                System.out.println("Fichier temporaire: " + file.getAbsolutePath());

                // Sauvegarder de façon permanente
                file.saveTo(
                        "/home/finaritra/Documents/cours/s5/Mr Naina/framework/myFramework/test-RotsyFramework/upload");

                mv.addData("message", "Fichier uploadé avec succès!");
                mv.addData("fileName", file.getFileName());
                mv.addData("size", file.getSize());
            }
        } catch (IOException e) {
            mv.addData("error", e.getMessage());
        }

        return mv;
    }

    @PostMapping("/upload/multiple")
    @Json
    public ModelView uploadMultiple(UploadedFile[] files) {
        ModelView mv = new ModelView("result.jsp");
        List<UploadedFile> toCleanup = new ArrayList<>();
        List<UploadedFile> uploadedFiles = new ArrayList<>();

        try {
            for (UploadedFile file : files) {
                if (file != null && !file.isEmpty()) {
                    // Traiter le fichier
                    file.saveTo(
                            "/home/finaritra/Documents/cours/s5/Mr Naina/framework/myFramework/test-RotsyFramework/upload");
                    uploadedFiles.add(file);
                }
            }
            // Passer les fichiers uploadés à la vue
            mv.addData("files", uploadedFiles.toArray(new UploadedFile[0]));
            mv.addData("message", uploadedFiles.size() + " fichier(s) uploadé(s) avec succès!");
        } catch (Exception e) {
            mv.addData("error", e.getMessage());
        } finally {
            // Nettoyer les fichiers temporaires non utilisés
            FileUploadUtil.cleanupFiles(toCleanup);
        }

        return mv;
    }

}