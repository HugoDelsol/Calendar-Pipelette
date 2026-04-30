import { ScheduleXCalendar } from '@schedule-x/react'
import useProviderCalendar from '../../hooks/useProviderCalendar'
import { useState, useCallback } from 'react'
import type { AppEvent } from '../../types/AppEvent'

function ClientModal({ event, onClose, }: { event: AppEvent, onClose: () => void }) {
  return (
    <div className="mt-4 p-6 bg-white border border-gray-200 rounded-lg shadow-sm">
      {/* Titre et Badge */}
      <button
        onClick={onClose}
        className="absolute top-2 right-2 text-gray-400 hover:text-gray-600 font-bold p-2"
      >
        ✕
      </button>
      <div className="flex justify-between items-center mb-4">
        <h2 className="text-xl font-bold text-gray-800">Détails du RDV</h2>
        <span className="px-2 py-1 bg-blue-100 text-blue-700 text-xs font-semibold rounded">
          Confirmé
        </span>
      </div>

      {/* Informations principales */}
      <div className="space-y-3">
        <div>
          <p className="text-xs text-gray-500 uppercase font-bold">Prestation</p>
          <p className="text-gray-900 font-medium">{event.title}</p>
        </div>

        <div className="grid grid-cols-2 gap-4">
          <div>
            <p className="text-xs text-gray-500 uppercase font-bold">Prénom</p>
            <p className="text-gray-900">{event.firstName || '—'}</p>
          </div>
          <div>
            <p className="text-xs text-gray-500 uppercase font-bold">Nom</p>
            <p className="text-gray-900">{event.lastName || '—'}</p>
          </div>
        </div>

        <div className="pt-2">
          <p className="text-xs text-gray-500 uppercase font-bold">Notes / Description</p>
          <p className="text-sm text-gray-600 mt-1 bg-gray-50 p-3 rounded border-l-4 border-gray-300">
            {event.description || "Aucune information supplémentaire."}
          </p>
        </div>
      </div>
    </div>
  )
}

export const ProviderDashboard = () => {

  const [selectedEvent, setSelectedEvent] = useState<AppEvent | null>(null);

  const handleClose = useCallback(() => {
    setSelectedEvent(null);
  }, []);

  const handleEventClick = useCallback((event: AppEvent) => {
    setSelectedEvent(event)
  }, [])

  const calendar = useProviderCalendar({
    onEventClick: handleEventClick
  })

  return (
    <div>
      <h1>Calendar</h1>

      <ScheduleXCalendar calendarApp={calendar} />

      {selectedEvent && (
        <ClientModal
          event={selectedEvent}
          onClose={handleClose}
        />
      )}

      <div onClick={() => console.log('TEST CLICK')}>
        TEST
      </div>
    </div>
  )
}