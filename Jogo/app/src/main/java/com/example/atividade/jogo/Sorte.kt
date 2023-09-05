package com.example.arrocha.jogo
import kotlin.random.Random.Default.nextInt

class Sorte(var limiteInferior: Int, var limiteSuperior: Int, var numeroSorteado: Int = nextInt(limiteInferior, limiteSuperior)) {

    var contador: Int = 0
    var feedback: Feedback = Feedback.INICIO

    fun chutar(chute: Int) : Boolean {
        if (chute > limiteInferior && chute < limiteSuperior && chute > numeroSorteado){
            limiteSuperior = chute
            contador++
            this.feedback = Feedback.MENOR
            return true
        } else if (chute > limiteInferior && chute < limiteSuperior && chute < numeroSorteado){
            limiteInferior = chute
            contador++
            this.feedback = Feedback.MAIOR
            return true
        } else {
            if(ganhou()){
                contador++
                this.feedback = Feedback.GANHOU
            } else {
                this.feedback = Feedback.PERDEU
            }
            return false
        }
    }

    fun ganhou(): Boolean {
        return this.limiteInferior + 1 == this.limiteSuperior - 1
    }


}