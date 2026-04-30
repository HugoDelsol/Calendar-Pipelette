import { useCalendarApp } from '@schedule-x/react'
import {
    createViewMonthAgenda,
    createViewMonthGrid,
    type CalendarEventExternal,
} from '@schedule-x/calendar'
import { createEventsServicePlugin } from '@schedule-x/events-service'
import '@schedule-x/theme-default/dist/index.css'
import { useMemo } from 'react'
import 'temporal-polyfill/global'

type UseProviderCalendarProps = {
    onEventClick: (event: CalendarEventExternal) => void
}

function useProviderCalendar({ onEventClick }: UseProviderCalendarProps) {
    const eventsService = useMemo(() => createEventsServicePlugin(), [])

    const events: CalendarEventExternal[] = [
        {
            id: '1',
            clientId: '6',
            title: 'Réhaussement + Teinture',
            start: Temporal.ZonedDateTime.from('2026-04-10T09:00[Europe/Paris]'),
            end: Temporal.ZonedDateTime.from('2026-04-10T10:00[Europe/Paris]'),
            firstName: "Lea",
            lastName: "Petigros",
            description: 'Allergie au poisson'

        },
    ]

    const calendar = useCalendarApp({
        views: [createViewMonthGrid(), createViewMonthAgenda()],
        events,
        plugins: [eventsService],
        locale: 'fr-FR',

        callbacks: {
            onEventClick: (calendarEvent: CalendarEventExternal) => {
                console.log("testtttttttttt")
                onEventClick(calendarEvent)
            },
        },
    })

    return calendar
}

export default useProviderCalendar