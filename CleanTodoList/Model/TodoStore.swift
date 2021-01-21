//
//  TodoStore.swift
//  CleanTodoList
//
//  Created by 장용범 on 2021/01/21.
//  Copyright © 2021 장용범. All rights reserved.
//

import Foundation


class TodoStore {
    
    static let shared = TodoStore()
    
    private init () {}
    
    private var todos: [Todo] = [
        Todo(title: "A", content: "미디어라고 해서 정형화된 콘텐츠만을 하는 것은 특별한 재미도, 의미도 없을 거 같았습니다. 특히, 힙합이라는 장르의 특성상, 자유로운 느낌 그 자체가 중요하다고 생각을 했죠. 그래서 힙합엘이는 기존의 틀에서 벗어난 프로젝트를 많이 해왔습니다. 그러다 보니 도전적인 시도도 많았고, 자연스럽게 아티스트나 음악 팬들이 인정해준 부분들이 생겼네요.", time: "January 21, 2021 at 9:51:52 PM"),
        Todo(title: "B", content: "힙합엘이는 대중과 음악가들에게 흑인 음악을 조금 더 친숙하게 전달하기 위해 만든 플랫폼이에요. 전 세계적인 흐름을 체크할 수 있는 빌보드 차트를 보시면 쉽게  알 수 있지만, 최근 몇 년 동안 가장 영향력이 큰 장르는 단연 힙합, 알앤비라고 할 수 있어요. 힙합엘이는 그런 세계적인 흐름을 자체 콘텐츠를 통해 한국에도 알리고, 한국 음악가들을 세계에도 전달하는 허브와 같은 역할을 하고 있어요. 실제로 한국 힙합 뮤지션의 아시아 투어를 기획하기도 하고, 타일러, 더 크리에이터(Tyler The Creator), 릴 펌프(Lil Pump), 뮤지크 소울차일드(Musiq Soulchild) 등 해외 유명 아티스트의 국내 단독 인터뷰를 진행하기도 했었죠.", time: "January 21, 2021 at 10:11:00 PM"),
        Todo(title: "C", content: "흑인 음악 뮤지션을 꿈꾸는 사람이 정말 많아졌어요. 하지만, 현실은 인디 아티스트가 음악적으로 성장하고, 꿈을 위해 탄탄한 수익 구조를 가져갈 수 있는 시스템이 정말 부족합니다. 이제는 그들을 위해 선순환 생태계를 만드는 것을 또 하나의 목표로 삼고 있어요. 예를 들면, 힙합엘이가 인디 뮤지션들의 앨범을 위해 제작비를 투자할 수도 있겠고, 유통 계약을 맺거나 홍보 프로모션을 진행할 수도 있겠죠. 꼭 유명 기획사에 들어가지 않아도 마음껏 창작 활동을 할 수 있고, 그에 따른 경제적인 가치도 당연히 얻을 수 있게끔 선순환 구조를 만드는 게 힙합엘이의 다음 목표입니다.", time: "January 21, 2021 at 10:31:22 PM")
    ]
    
    func todoList() -> [Todo] {
        todos
    }
    
    func todo(at index: Int) -> Todo {
        todos[index]
    }
    
    func addTodo(todo: Todo) {
        todos.append(todo)
    }
}
