//
//  Extensions.swift
//  DateRangeSelector
//
//  Created by Amir on 3/4/21.
//

import Foundation
import UIKit

extension Date {
    static func from(year: Int, month: Int, day: Int) -> Date {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return calendar.date(from: dateComponents) ?? Date()
    }
}

extension UIView {
    func fixInView(_ container: UIView!) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.frame = container.frame
        container.addSubview(self)
        NSLayoutConstraint(
            item: self,
            attribute: .leading,
            relatedBy: .equal,
            toItem: container,
            attribute: .leading,
            multiplier: 1.0,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: self,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: container,
            attribute: .trailing,
            multiplier: 1.0,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: self,
            attribute: .top,
            relatedBy: .equal,
            toItem: container,
            attribute: .top,
            multiplier: 1.0,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: self,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: container,
            attribute: .bottom,
            multiplier: 1.0,
            constant: 0).isActive = true
    }
}

extension Date {
    func areSameDay(date: Date?) -> Bool {
        guard let date = date else { return false }
        return Calendar.current.compare(self, to: date, toGranularity: .day) == ComparisonResult.orderedSame
    }

    static func date(day: Int, month: Int, year: Int) -> Date {
        var dateComponents = DateComponents()

        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day

        return Calendar.current.date(from: dateComponents) ?? .init()
    }

    var startOfDay: Date {
        var components = dateComponents

        components.hour = 0
        components.minute = 0
        components.second = 0

        return Calendar.current.date(from: components) ?? .init()
    }

    var endOfTheDay: Date {
        var components = dateComponents

        components.hour = 23
        components.minute = 59
        components.second = 59

        return Calendar.current.date(from: components) ?? .init()
    }

    var firstDayOfTheMonth: Date {
        let startOfDay = Calendar.current.startOfDay(for: self)
        let dateComponents = Calendar.current.dateComponents([.year, .month], from: startOfDay)

        return Calendar.current.date(from: dateComponents) ?? .init()
    }

    var firstDayOfPreviousMonth: Date {
        firstDay(followingMonth: false)
    }

    var firstDayOfFollowingMonth: Date {
        firstDay(followingMonth: true)
    }

    var monthDayAndYearComponents: DateComponents {
        dateComponents(components: [.month, .year])
    }

    var weekDay: Int {
        dateComponents.weekday ?? .zero
    }

    var numberOfDaysInMonth: Int {
        Calendar.current.range(of: .day, in: .month, for: self)?.count ?? .zero
    }

    var day: Int {
        dateComponents.day ?? .zero
    }

    var month: Int {
        dateComponents.month ?? .zero
    }

    var year: Int {
        dateComponents.year ?? .zero
    }

    var minute: Int {
        dateComponents.minute ?? .zero
    }

    var second: Int {
        dateComponents.second ?? .zero
    }

    var hour: Int {
        dateComponents.hour ?? .zero
    }

    // MARK: - Private variable and methods.

    private var dateComponents: DateComponents {
        dateComponents(components: [.second, .hour, .day, .weekday, .month, .year])
    }

    private func dateComponents(components: Set<Calendar.Component>) -> DateComponents {
        let components = Calendar.current.dateComponents(components, from: self)
        return components
    }

    private func firstDay(followingMonth: Bool) -> Date {
        var dateComponent = DateComponents()
        dateComponent.month = followingMonth ? 1: -1

        let date = Calendar.current.date(byAdding: dateComponent, to: self)
        return date?.firstDayOfTheMonth ?? .init()
    }
}
