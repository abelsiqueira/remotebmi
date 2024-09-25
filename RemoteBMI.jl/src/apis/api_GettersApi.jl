# This file was generated by the Julia OpenAPI Code Generator
# Do not modify this file directly. Modify the OpenAPI specification instead.


function get_value_read(handler)
    function get_value_read_handler(req::HTTP.Request)
        openapi_params = Dict{String,Any}()
        path_params = HTTP.getparams(req)
        openapi_params["name"] = OpenAPI.Servers.to_param(String, path_params, "name", required=true, )
        req.context[:openapi_params] = openapi_params

        return handler(req)
    end
end

function get_value_validate(handler)
    function get_value_validate_handler(req::HTTP.Request)
        openapi_params = req.context[:openapi_params]
        
        OpenAPI.validate_param("name", "get_value", :minLength, openapi_params["name"], 1)
        
        return handler(req)
    end
end

function get_value_invoke(impl; post_invoke=nothing)
    function get_value_invoke_handler(req::HTTP.Request)
        openapi_params = req.context[:openapi_params]
        ret = impl.get_value(req::HTTP.Request, openapi_params["name"];)
        resp = OpenAPI.Servers.server_response(ret)
        return (post_invoke === nothing) ? resp : post_invoke(req, resp)
    end
end

function get_value_at_indices_read(handler)
    function get_value_at_indices_read_handler(req::HTTP.Request)
        openapi_params = Dict{String,Any}()
        path_params = HTTP.getparams(req)
        openapi_params["name"] = OpenAPI.Servers.to_param(String, path_params, "name", required=true, )
        openapi_params["request_body"] = OpenAPI.Servers.to_param_type(Vector{Int64}, String(req.body))
        req.context[:openapi_params] = openapi_params

        return handler(req)
    end
end

function get_value_at_indices_validate(handler)
    function get_value_at_indices_validate_handler(req::HTTP.Request)
        openapi_params = req.context[:openapi_params]
        
        OpenAPI.validate_param("name", "get_value_at_indices", :minLength, openapi_params["name"], 1)
        
        return handler(req)
    end
end

function get_value_at_indices_invoke(impl; post_invoke=nothing)
    function get_value_at_indices_invoke_handler(req::HTTP.Request)
        openapi_params = req.context[:openapi_params]
        ret = impl.get_value_at_indices(req::HTTP.Request, openapi_params["name"], openapi_params["request_body"];)
        resp = OpenAPI.Servers.server_response(ret)
        return (post_invoke === nothing) ? resp : post_invoke(req, resp)
    end
end


function registerGettersApi(router::HTTP.Router, impl; path_prefix::String="", optional_middlewares...)
    HTTP.register!(router, "GET", path_prefix * "/get_value/{name}", OpenAPI.Servers.middleware(impl, get_value_read, get_value_validate, get_value_invoke; optional_middlewares...))
    HTTP.register!(router, "POST", path_prefix * "/get_value_at_indices/{name}", OpenAPI.Servers.middleware(impl, get_value_at_indices_read, get_value_at_indices_validate, get_value_at_indices_invoke; optional_middlewares...))
    return router
end
