vec3 phongLight() {
    vec3 normal = normalize(v_Normal);
    vec3 lightDirection = normalize(v_LightDirection);
    float lambertTerm = dot(normal, -lightDirection);
    vec3 Ia = u_LightAmbient * baseColor;
    vec3 Id = vec3(0.0, 0.0, 0.0);
    vec3 Is = vec3(0.0, 0.0, 0.0);
    if (lambertTerm > 0.0) {
        Id = baseColor * lambertTerm;
        vec3 E = normalize(v_EyeVector);
        vec3 R = reflect(lightDirection, normal);
        float specular = pow(max(dot(R, E), 0.0), u_Shininess);
        Is = u_LightColor * specular;
    }
    return (Ia.r > 0.0 || Ia.g > 0.0 || Ia.b > 0.0) ?  Ia + Id + Is : Id + Is;
}

#pragma glslify: export(phongLight)
