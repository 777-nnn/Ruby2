class Janken

    def initialize
        @@jankens = ["グー","チョキ","パー"]
        @pc_hand = ""
        @npc_hand = ""
        @janken_result = ""

        @@fingers = ["上","右","下","左"]
        @pc_finger = ""
        @npc_finger = ""
    end

    def start

        if @janken_result != "あいこ" then
            puts "じゃんけん・・・"
        else
            puts "あいこで・・・"
        end

        puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
                
        @pc_hand = gets.to_i
        @npc_hand = rand(3)

        self.judgeJanken()

    end

    def judgeJanken

        if @pc_hand >= 0 && @pc_hand <= 2 then

            if @janken_result != "あいこ" then
                puts "ぽん！"
            else
                puts "しょ！"
            end

            puts "--------------------"
            puts "あなた : #{@@jankens[@pc_hand]}を出しました"
            puts "相手 : #{@@jankens[@npc_hand]}を出しました"

            if @pc_hand == @npc_hand then
                @janken_result = "あいこ"
                self.start()
            elsif (@pc_hand == 0 && @npc_hand == 1) || (@pc_hand == 1 && @npc_hand == 2) || (@pc_hand == 2 && @npc_hand == 0) then
                @janken_result = "勝ち"
                self.secondBattle()
            else
                @janken_result = "負け"
                self.secondBattle()
            end

        elsif @pc_hand == 3 then
            puts "あなた: 戦いませんでした"
        else
            puts "不正な値です"
            self.start()
        end
    end

    def secondBattle

        puts "あっち向いて・・・"
        puts "0(上) 1(右) 2(下) 3(左)"

        @pc_finger = gets.to_i
        @npc_finger = rand(4)

        self.secondJudge()

    end

    def secondJudge

        if @pc_finger >= 0 && @pc_finger <= 3 then
            puts "ほい！"
            puts "--------------------"
            puts "あなた : #{@@fingers[@pc_finger]}を出しました"
            puts "相手 : #{@@fingers[@npc_finger]}を出しました"

            if @pc_finger == @npc_finger then
                puts "--------------------"
                puts "あなたの#{@janken_result}です！"
            else
                self.start()
            end

        else
            puts "不正な値です"
            self.secondJudge()
        end

    end

end

jankenBattle = Janken.new()
jankenBattle.start()




