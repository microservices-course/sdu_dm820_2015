/*

The MIT License (MIT)

Copyright (c) 2015 Fabrizio Montesi <famontesi@gmail.com>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

type AdminToken: string

type OpenRequest: void {
	.username: string
	.roomName: string
}

type CloseRequest: void {
	.username: string
	.roomName: string
	.adminToken: AdminToken
}

type PublishRequest: void {
	.username: string
	.roomName: string
	.message: string
}

type HistoryRequest: void {
	.roomName: string
}

type FaultyToken: void {
	.roomName: string
	.adminToken: AdminToken
}

type FaultyRoom: void {
	.errorMessage: string
	.roomName: string
}

interface ChatInterface {
RequestResponse:
	openRoom(OpenRequest)(string) throws FaultyRoom,
	closeRoom(CloseRequest)(void) throws FaultyRoom FaultyToken,
	publish(PublishRequest)(void) throws FaultyRoom,
	getHistory(HistoryRequest)(string) throws FaultyRoom
}
