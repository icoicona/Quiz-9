//
//  QuizViewController.swift
//  Quiz
//
//  Created by litech on 2015/02/10.
//  Copyright (c) 2015年 LifeisTech. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    //クイズを格納する配列
    var quizArray = [[Any]]()
    
    //正解数
    var correctAnswer: Int = 0
    
    //クイズを表示するTextView
    @IBOutlet var quizTextView: UITextView!
    
    //選択肢のボタン
    @IBOutlet var choiceButtons1: UIButton!
    @IBOutlet var choiceButtons2: UIButton!
    @IBOutlet var choiceButtons3: UIButton!
    
    @IBOutlet var imageview:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //------------------------ここから下にクイズを書く------------------------//
        quizArray.append(["NiziUのデビュー曲の名前は？", "FIESTA", "Make you happy", "Fake & True", 2 ,"IMG_6012.JPG"])
        quizArray.append(["BLACKPINKは何人組みのガールズグループか？", "５人", "７人", "４人", 3, "IMG_2451.JPG"])
        quizArray.append(["Twiceの豆腐と言われているメンバーは誰？", "ダヒョン", "ナヨン", "サナ", 1, "IMG_5784.JPG"])
        quizArray.append(["Twiceの赤ちゃんの怪獣と呼ばれているメンバーは誰？", "チェヨン", "ツウィ", "ミナ", 1, "IMG_6005.JPG"])
        quizArray.append(["Twiceの豆腐と言われているメンバーは誰？", "ダヒョン", "ナヨン", "サナ", 1 ,"IMG_6004.JPG"])
        quizArray.append(["ITZYのファンの呼び名は？", "ONCE", "MIDZY", "BLINK", 2 ,"IMG_5802.JPG"])
        quizArray.append(["IZ*ONEの日本人メンバーは何人？", "４人", "２人", "３人", 3 ,"IMG_6009.JPG"])
        quizArray.append(["ITZYのリーダーは誰？", "イｴジ", "ユナ", "リュジン", 1 ,"IMG_5803.JPG"])
         quizArray.append(["この中でBLACKPINKにいないのは？", "ロゼ", "ナヨン", "ジス", 2 ,"IMG_5806.JPG"])
        quizArray.append(["TWICEのデビューメンバーを選抜するオーデイション番組の名前は？", "SEVENTEEN", "PRODUCE48", "SIXTEEN", 3, "IMG_6015.JPG"])
        
        //------------------------ここから上にクイズを書く------------------------//
        
        //quizArrayの中身をシャッフルする
        quizArray.shuffle()

        choiceQuiz()
    }
    
    func choiceQuiz() {
        quizTextView.text = quizArray[0][0] as? String
        
        //選択肢のボタンにそれぞれ選択肢のテキストをセット
        choiceButtons1.setTitle(quizArray[0][1] as? String, for: .normal)
        choiceButtons2.setTitle(quizArray[0][2] as? String, for: .normal)
        choiceButtons3.setTitle(quizArray[0][3] as? String, for: .normal)
        imageview.image = UIImage(named: quizArray[0][5] as? String ?? "IMG_6017.JPG")
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        if quizArray[0][4] as! Int == sender.tag {
            //正解数を増やす
            correctAnswer+=1
        }
        
        quizArray.remove(at: 0)
        //解いた問題数の合計が予め設定していた問題数に達したら結果画面へ
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toResultView") {
            
            let resultView = segue.destination as! ResultViewController
            resultView.correctAnswer = self.correctAnswer
        }
    }
}


