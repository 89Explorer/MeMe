//
//  MemoManager.swift
//  MeMe
//
//  Created by 권정근 on 12/20/24.
//

import Foundation

protocol MemoCRUD {
    func addMemo(_ newMemo: Memo)
    func updateMemo(_ updateMemo: Memo)
    func deleteMemo(with memoId: String)
    func getMemo(with memoId: String) -> Memo?
    func getMemos() -> [Memo]
}

// MemoManager 클래스 정의
class MemoManager: MemoCRUD, Codable {

    private var memos: [Memo] = []
    
    // 메모 추가
    func addMemo(_ newMemo: Memo) {
        memos.append(newMemo)
    }
    
    func updateMemo(_ updateMemo: Memo) {
        for (index, memo) in memos.enumerated() {
            if memo.id == updateMemo.id {
                memos[index] = updateMemo
                break
            }
        }
    }
    
    func deleteMemo(with memoId: String) {
        memos.removeAll(where: { memo in
            return memo.id == memoId
        })
    }
    
    func getMemo(with memoId: String) -> Memo? {
        return memos.first(where: { memo in
            return memo.id == memoId
        })
    }
    
    func getMemos() -> [Memo] {
        return memos
    }
    
}
