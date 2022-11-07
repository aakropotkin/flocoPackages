{

  inputs.packument.url   = "https://registry.npmjs.org/axios-ntlm?rev=18-2b8e1b5c20d6b4c86feaf1049595f80e";
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
    ident = "axios-ntlm";
    ldir  = "info/unscoped/a/axios-ntlm";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
