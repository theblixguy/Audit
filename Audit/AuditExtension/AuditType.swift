//
//  Type.swift
//  AuditExtension
//
//  Created by Suyash Srijan on 08/04/2018.
//  Copyright © 2018 Suyash Srijan. All rights reserved.
//

import Foundation

enum AuditType: String {
    
    case Fake = "fake", Satire = "satire", Bias = "bias", Conspiracy = "conspiracy", Rumor = "rumor", State = "state", JunkSci = "junksci", Hate = "hate", Clickbait = "clickbait", Unreliable = "unreliable", Political = "political", Reliable = "reliable", Unknown
    
    private static let all: [AuditType] = [Fake, Satire, Bias, Conspiracy, Rumor, State, JunkSci, Hate, Clickbait, Unreliable, Political, Reliable]
    
    init(value: String) {
        if let type = AuditType.all.first(where: {$0.rawValue == value}) {
            self = type
        } else {
            self = AuditType.Unknown
        }
    }
    
    func description() -> String {
        switch self {
        case .Fake: return "This website entirely fabricates information, disseminates deceptive content, or grossly distorts actual news reports"
        case .Satire: return "This website uses humor, irony, exaggeration, ridicule, and false information to comment on current events"
        case .Bias: return "This website provides news that comes from a particular point of view and may rely on propaganda, decontextualized information, and opinions distorted as facts"
        case .Conspiracy: return "This website is a well-known promoter of kooky conspiracy theories"
        case .Rumor: return "This website promotes rumors, gossip, innuendo, and unverified claims"
        case .State: return "This website promotes news from repressive states operating under government sanction"
        case .JunkSci: return "This website promotes pseudoscience, metaphysics, naturalistic fallacies, and other scientifically dubious claims"
        case .Hate: return "This website actively promotes racism, misogyny, homophobia, and other forms of discrimination"
        case .Clickbait: return "This website provides generally credible content, but uses exaggerated, misleading, or questionable headlines, social media descriptions, and/or images"
        case .Unreliable: return "This website provides news that may be reliable but whose contents require further verification"
        case .Political: return "This website provides generally verifiable information in support of certain points of view or political orientations"
        case .Reliable: return "This website circulates news and information in a manner consistent with traditional and ethical practices in journalism"
        case .Unknown: return "No credibility information is available for this website!"
        }
    }
    
    func title() -> String {
        switch self {
        case .Fake: return "Fake News"
        case .Satire: return "Satire"
        case .Bias: return "Extreme Bias"
        case .Conspiracy: return "Conspiracy Theory"
        case .Rumor: return "Rumor Mill"
        case .State: return "State News"
        case .JunkSci: return "Junk Science"
        case .Hate: return "Hate News"
        case .Clickbait: return "Clickbait"
        case .Unreliable: return "Proceed With Caution"
        case .Political: return "Political"
        case .Reliable: return "Credible"
        case .Unknown: return "Unknown"
        }
    }
    
}
