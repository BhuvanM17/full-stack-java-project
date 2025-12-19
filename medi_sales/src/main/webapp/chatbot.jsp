<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MediSales Assistant</title>
        <!-- Tailwind CSS -->
        <script src="https://cdn.tailwindcss.com"></script>
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css2?family=Outfit:wght@300;400;500;600;700&display=swap"
            rel="stylesheet">
        <style>
            body {
                font-family: 'Outfit', sans-serif;
                background: transparent;
                margin: 0;
                padding: 0;
                overflow: hidden;
            }

            .chat-container {
                height: 100vh;
                display: flex;
                flex-direction: column;
                justify-content: flex-end;
                padding: 20px;
            }
        </style>
    </head>

    <body>
        <div id="root"></div>

        <!-- React Dependencies -->
        <script crossorigin src="https://unpkg.com/react@18/umd/react.production.min.js"></script>
        <script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.production.min.js"></script>
        <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

        <script type="text/babel">
            const { useState, useRef, useEffect } = React;

            const KNOWLEDGE_BASE = `
        MediSales is a comprehensive pharmaceutical ERP system.
        Key Features:
        - Billing: Dashboard -> Billing (/generatebill)
        - Inventory: Dashboard -> Inventory (/getallstocks)
        - New Stock: Dashboard -> New Stock (/createstock)
        - Settings: Dashboard -> Settings (/fetchDto)
        `;

            const App = () => {
                const [isOpen, setIsOpen] = useState(false);
                const [isMinimized, setIsMinimized] = useState(false);
                const [messages, setMessages] = useState([
                    { role: 'bot', text: '👋 Hi! I\'m your MediSales Assistant. How can I help you today?' }
                ]);
                const [input, setInput] = useState('');
                const [isTyping, setIsTyping] = useState(false);
                const chatEndRef = useRef(null);

                useEffect(() => {
                    chatEndRef.current?.scrollIntoView({ behavior: 'smooth' });
                }, [messages]);

                const callGemini = async (prompt) => {
                    try {
                        // Get the context path safely using JSP scriptlet
                        const contextPath = "<%= request.getContextPath() %>" || "";
                        const url = (contextPath + "/api/chatWithAi?prompt=").replace("//", "/");

                        const response = await fetch(url + encodeURIComponent(prompt));

                        if (!response.ok) {
                            const errorText = await response.text();
                            return "Server Error (" + response.status + "): " + (errorText || "Could not reach AI backend");
                        }

                        const text = await response.text();
                        return text;
                    } catch (error) {
                        console.error("Chatbot Fetch Error:", error);
                        return "Connectivity Error: " + error.message;
                    }
                };

                const handleSend = async () => {
                    if (!input.trim() || isTyping) return;
                    const userText = input.trim();
                    setMessages(prev => [...prev, { role: 'user', text: userText }]);
                    setInput('');
                    setIsTyping(true);

                    const botResponse = await callGemini(userText);

                    setMessages(prev => [...prev, {
                        role: 'bot',
                        text: botResponse
                    }]);
                    setIsTyping(false);
                };

                if (!isOpen) {
                    return (
                        <div className="fixed bottom-5 right-5">
                            <button
                                onClick={() => setIsOpen(true)}
                                className="w-16 h-16 bg-indigo-600 rounded-full shadow-2xl flex items-center justify-center text-white hover:scale-110 transition-transform cursor-pointer"
                            >
                                <i className="fas fa-comment-dots text-2xl"></i>
                            </button>
                        </div>
                    );
                }

                return (
                    <div className={`fixed bottom-5 right-5 flex flex-col items-end transition-all duration-300 ${isMinimized ? 'h-16' : 'h-[550px]'}`}>
                        <div className={`bg-slate-900 w-80 md:w-96 rounded-2xl shadow-2xl flex flex-col overflow-hidden border border-white/10 ${isMinimized ? 'h-16' : 'h-full'}`}>
                            {/* Header */}
                            <div
                                className="bg-indigo-600 p-4 flex items-center justify-between cursor-pointer"
                                onClick={() => isMinimized && setIsMinimized(false)}
                            >
                                <div className="flex items-center gap-3 text-white">
                                    <i className="fas fa-robot"></i>
                                    <span className="font-bold">MediSales Assistant</span>
                                </div>
                                <div className="flex gap-3 text-white/80">
                                    <button onClick={(e) => { e.stopPropagation(); setIsMinimized(!isMinimized); }}>
                                        <i className={`fas ${isMinimized ? 'fa-expand-alt' : 'fa-minus'}`}></i>
                                    </button>
                                    <button onClick={(e) => { e.stopPropagation(); setIsOpen(false); }}>
                                        <i className="fas fa-times"></i>
                                    </button>
                                </div>
                            </div>

                            {!isMinimized && (
                                <>
                                    {/* Messages */}
                                    <div className="flex-1 overflow-y-auto p-4 space-y-4 bg-slate-800/50">
                                        {messages.map((m, i) => (
                                            <div key={i} className={`flex ${m.role === 'user' ? 'justify-end' : 'justify-start'}`}>
                                                <div className={`max-w-[85%] p-3 rounded-2xl text-sm ${m.role === 'user' ? 'bg-indigo-600 text-white rounded-br-none' : 'bg-slate-700 text-white rounded-bl-none'}`}>
                                                    {m.text}
                                                </div>
                                            </div>
                                        ))}
                                        {isTyping && (
                                            <div className="flex justify-start">
                                                <div className="bg-slate-700 p-3 rounded-2xl rounded-bl-none">
                                                    <div className="flex gap-1">
                                                        <div className="w-1.5 h-1.5 bg-white/50 rounded-full animate-bounce"></div>
                                                        <div className="w-1.5 h-1.5 bg-white/50 rounded-full animate-bounce [animation-delay:-.3s]"></div>
                                                        <div className="w-1.5 h-1.5 bg-white/50 rounded-full animate-bounce [animation-delay:-.5s]"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        )}
                                        <div ref={chatEndRef} />
                                    </div>

                                    <div className="p-4 bg-slate-900 border-t border-white/10 flex gap-2">
                                        <input
                                            type="text"
                                            value={input}
                                            onChange={(e) => setInput(e.target.value)}
                                            onKeyPress={(e) => e.key === 'Enter' && handleSend()}
                                            placeholder="Ask me something..."
                                            className="flex-1 bg-slate-800 text-white text-sm rounded-xl px-4 py-2 outline-none border border-white/5"
                                            disabled={isTyping}
                                        />
                                        <button
                                            onClick={handleSend}
                                            className="bg-indigo-600 text-white p-2 rounded-xl disabled:opacity-50"
                                            disabled={isTyping}
                                        >
                                            <i className="fas fa-paper-plane"></i>
                                        </button>
                                    </div>
                                </>
                            )}
                        </div>
                    </div>
                );
            };

            const root = ReactDOM.createRoot(document.getElementById('root'));
            root.render(<App />);
        </script>
    </body>

    </html>