{

  inputs.packument.url   = "https://registry.npmjs.org/eventemitter2?rev=163-10980f9f2d380b0b0d1685cf6c4e8a06";
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
    ident = "eventemitter2";
    ldir  = "info/unscoped/e/eventemitter2";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
