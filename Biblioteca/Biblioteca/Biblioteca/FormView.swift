//
//  FormView.swift
//  Biblioteca
//
//  Created by ifpb on 03/07/23.
//

import SwiftUI

struct FormView: View {
    @State private var nome:String = ""
    @State private var autor:String = ""
    @State private var editora:String = ""
    @State private var status:String = ""
    @State private var emprestado:Bool = false
    @Environment(\.presentationMode) private var presentation
    @Environment(\.managedObjectContext) private var viewContext
    
    var body: some View {
        Form{
            
            Section {
                TextField("Nome", text: self.$nome)
            }
            Section {
                TextField("Autor", text: self.$autor)
            }
            Section {
                TextField("Editora", text: self.$editora)
            }
            Section {
                TextField("Status", text: self.$status)
            }
            Section {
                Toggle("Emprestado", isOn: self.$emprestado)
            }

        }
        .navigationTitle("Formulário")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Salvar"){
                    withAnimation {
                        let livro = Livro(context: viewContext)
                        livro.nome = self.nome
                        livro.autor = self.autor
                        livro.editora = self.editora
                        livro.status = self.status
                        livro.emprestado = self.emprestado

                        do {
                            try viewContext.save()
                        } catch {
                            let nsError = error as NSError
                            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                        }
                    }
                    
                    self.presentation.wrappedValue.dismiss()
                }
            }
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
