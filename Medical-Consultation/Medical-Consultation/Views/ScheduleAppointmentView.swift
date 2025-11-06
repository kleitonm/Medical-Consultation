//
//  ScheduleAppointmentView.swift
//  Medical-Consultation
//
//  Created by Kleiton Mendes on 06/11/25.
//

import SwiftUI

struct ScheduleAppointmentView: View {
    
    // MARK: - Atributtes
    let service = WebService()
    let specialistID: String
    let isRescheduleView: Bool
    let appointmentID: String?
    
    // MARK: - States
    @State private var selectedDate = Date()
    @State private var showAlert = false
    @State private var isAppointmentScheduled = false
    
    init(specialistID: String, isRescheduleView: Bool = false, appointmentID: String? = nil) {
        self.specialistID = specialistID
        self.isRescheduleView = isRescheduleView
        self.appointmentID = appointmentID
    }
    
    func rescheduleAppointment() async {
        guard let appointmentID else {
            print("Houve um erro ao obter o ID da consulta")
            return
        }
        do {
            if let _ = try await service.rescheduleAppointment(appointmentID: appointmentID, date: selectedDate.convertToString()) {
                isAppointmentScheduled = true
            } else {
                isAppointmentScheduled = false
            }
        } catch {
            print("Ocorreu um erro ao remarcar consulta: \(error.localizedDescription)")
            isAppointmentScheduled = false
        }
        showAlert = false
    }
    
    // MARK: - UI
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}
