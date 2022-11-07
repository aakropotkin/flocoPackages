{

  inputs.packument.url   = "https://registry.npmjs.org/w3c-xmlserializer?rev=16-77e468a6f43746ff4bc9f270394fd210";
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
    ident = "w3c-xmlserializer";
    ldir  = "info/unscoped/w/w3c-xmlserializer";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
