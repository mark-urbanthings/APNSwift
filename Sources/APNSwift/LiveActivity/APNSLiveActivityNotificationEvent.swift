//===----------------------------------------------------------------------===//
//
// This source file is part of the APNSwift open source project
//
// Copyright (c) 2022 the APNSwift project authors
// Licensed under Apache License v2.0
//
// See LICENSE.txt for license information
// See CONTRIBUTORS.txt for the list of APNSwift project authors
//
// SPDX-License-Identifier: Apache-2.0
//
//===----------------------------------------------------------------------===//

import struct Foundation.Date
import struct Foundation.TimeInterval

public struct APNSLiveActivityNotificationEvent: Hashable {
    
    /// The underlying raw value that is send to APNs.
    @usableFromInline
    internal let rawValue: String

    @usableFromInline
    internal let dismissalTime: Int?

    /// Specifies that live activity should be updated
    public static let update = Self(rawValue: "update", dismissalTime: nil)
    
    /// Specifies that live activity should be ended
    public static let end = Self(rawValue: "end", dismissalTime: nil)

    /// Specifies that live activity should be ended with dismissal from view
    /// at a specific point in time.
    public static func end(dismissalTime: Date) -> Self {
        Self(rawValue: "end", dismissalTime: Int(dismissalTime.timeIntervalSince1970))
    }

    /// Specifies that live activity should be ended with dismissal from view
    /// in a given number of seconds
    public static func end(dismissalIn: Int) -> Self {
        end(dismissalTime: Date(timeIntervalSinceNow: TimeInterval(dismissalIn)))
    }
}
