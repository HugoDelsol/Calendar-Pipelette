import type { CalendarEventExternal } from '@schedule-x/calendar'
export interface AppEvent extends CalendarEventExternal {
  id: string
  clientId: string
  title: string
  firstName: string
  lastName: string
  description?: string
}