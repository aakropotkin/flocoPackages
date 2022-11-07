{

  inputs.packument.url   = "https://registry.npmjs.org/internal-slot?rev=4-6319c184eca72551a5571a1074886904";
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
    ident = "internal-slot";
    ldir  = "info/unscoped/i/internal-slot";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
