{

  inputs.packument.url   = "https://registry.npmjs.org/http-cache-semantics?rev=30-ce9774715e3167d57b48e46ca587309d";
  inputs.packument.flake = false;

  outputs = inputs: let
    importJSON = f: builtins.fromJSON ( builtins.readFile f );
    packument  = importJSON inputs.packument;
    fetchInfo  = if ! builtins.pathExists ./fetchInfo.json then {} else
                 importJSON ./fetchInfo.json;
    latest'    = if ! ( packument ? dist-tags.latest ) then {} else {
      latestVersion = packument.dist-tags.latest;
      latest        = packument.versions.${packument.dist-tags.latest};
    };
  in {
    scope = null;
    ident = "http-cache-semantics";
    ldir  = "info/unscoped/h/http-cache-semantics";
    inherit packument fetchInfo;
  } // latest';

}
