@param Boolean error = false
@param String errorMessage = null
@param Boolean logout = false
@param String logoutMessage = null
@param org.springframework.security.web.csrf.CsrfToken csrf = null

@template.layout.default(
content = @`
    <div class="min-h-screen flex items-center justify-center py-12 px-4 sm:px-6 lg:px-8">
        <div class="max-w-md w-full space-y-8">
            <div>
                <h2 class="mt-6 text-center text-3xl font-extrabold text-gray-900">
                    Sign in to your account
                </h2>
            </div>

            @if(error)
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
                <strong class="font-bold">Error!</strong>
                <span class="block sm:inline">${errorMessage != null ? errorMessage : "An error occurred during login"}</span>
                @endif

                @if(logout)
                <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative"
                     role="alert">
                    <strong class="font-bold">Success!</strong>
                    <span class="block sm:inline">${logoutMessage != null ? logoutMessage : "You have been logged out"}</span>
                    @endif

                    <form class="mt-8 space-y-6" action="/login" method="POST">

                        @if(csrf != null)
                            <input type="hidden" name="${csrf.getParameterName()}" value="${csrf.getToken()}">
                        @endif

                        <div class="rounded-md shadow-sm space-y-4">
                            <div>
                                <label for="email-address" class="sr-only">Email address</label>
                                <input id="email-address" name="email" type="email" autocomplete="email" required
                                       class="appearance-none rounded-lg relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 focus:z-10 sm:text-sm"
                                       placeholder="Email address">
                            </div>
                            <div>
                                <label for="password" class="sr-only">Password</label>
                                <input id="password" name="password" type="password" autocomplete="current-password"
                                       required
                                       class="appearance-none rounded-lg relative block w-full px-3 py-2 border border-gray-300 placeholder-gray-500 text-gray-900 focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500 focus:z-10 sm:text-sm"
                                       placeholder="Password">
                            </div>
                        </div>

                        <div class="flex items-center justify-between">
                            <div class="flex items-center">
                                <input id="remember-me" name="remember-me" type="checkbox"
                                       class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300 rounded">
                                <label for="remember-me" class="ml-2 block text-sm text-gray-900">
                                    Remember me
                                </label>
                            </div>

                            <div class="text-sm">
                                <a href="#" class="font-medium text-blue-600 hover:text-blue-500">
                                    Forgot your password?
                                </a>
                            </div>
                        </div>

                        <div>
                            <button type="submit"
                                    class="group relative w-full flex justify-center py-2 px-4 border border-transparent text-sm font-medium rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-blue-500">
                                Sign in
                            </button>
                        </div>

                        <div class="relative my-6">
                            <div class="absolute inset-0 flex items-center">
                                <div class="w-full border-t border-gray-300"></div>
                            </div>
                            <div class="relative flex justify-center text-sm">
                                <span class="px-2 bg-gray-50 text-gray-500">Or continue with</span>
                            </div>
                        </div>

                        <div class="grid grid-cols-3 gap-3">
                            <!-- Google -->
                            <a href="/oauth2/authorization/google"
                               class="w-full inline-flex items-center justify-center px-4 py-2 border border-gray-300 rounded-md shadow-sm text-sm font-medium text-gray-500 bg-white hover:bg-gray-50 focus:outline-none focus:ring-2 focus:ring-offset-2 focus:ring-indigo-500">
                                <img class="h-5 w-5 mr-2" src="https://www.svgrepo.com/show/475656/google-color.svg" alt="Google logo">
                                <span class="sr-only">Sign in with Google</span>
                            </a>

                            <!-- Okta -->
                            <a href="/oauth2/authorization/okta"
                               class="w-full inline-flex justify-center py-2 px-4 border border-gray-300 rounded-md shadow-sm bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                <img src="https://www.okta.com/sites/default/files/Okta_Logo_BrightBlue_Medium.png"
                                     alt="Okta" class="h-5 w-5">
                                <span class="sr-only">Sign in with Okta</span>
                            </a>

                            <!-- Azure -->
                            <a href="/oauth2/authorization/entra-id"
                               class="w-full inline-flex justify-center py-2 px-4 border border-gray-300 rounded-md shadow-sm bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                <img src="https://www.microsoft.com/favicon.ico" alt="Azure" class="h-5 w-5">
                                <span class="sr-only">Sign in with Azure</span>
                            </a>

                            <!-- GitHub -->
                            <a href="/oauth2/authorization/github"
                               class="w-full inline-flex justify-center py-2 px-4 border border-gray-300 rounded-md shadow-sm bg-white text-sm font-medium text-gray-500 hover:bg-gray-50">
                                <img src="https://github.com/favicon.ico" alt="GitHub" class="h-5 w-5">
                                <span class="sr-only">Sign in with GitHub</span>
                            </a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
`)
