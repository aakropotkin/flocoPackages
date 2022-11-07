{

  inputs.packument.url   = "https://registry.npmjs.org/ansi-html-community?rev=1-6e880d8f91b4b130a5b452c522aa84bb";
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
    ident = "ansi-html-community";
    ldir  = "info/unscoped/a/ansi-html-community";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
