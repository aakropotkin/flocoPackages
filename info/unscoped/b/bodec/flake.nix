{

  inputs.packument.url   = "https://registry.npmjs.org/bodec?rev=13-e547cec76fdc08390d23b11ed34ecf4d";
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
    ident = "bodec";
    ldir  = "info/unscoped/b/bodec";
    inherit packument fetchInfo;
  } // latest';

}
