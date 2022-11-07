{

  inputs.packument.url   = "https://registry.npmjs.org/nib?rev=130-8d087b4c1170de946b5967836c821066";
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
    ident = "nib";
    ldir  = "info/unscoped/n/nib";
    inherit packument fetchInfo;
  } // latest';

}
