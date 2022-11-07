{

  inputs.packument.url   = "https://registry.npmjs.org/kleur?rev=24-240387bf79ba5adca4c06ac734e05854";
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
    ident = "kleur";
    ldir  = "info/unscoped/k/kleur";
    inherit packument fetchInfo;
  } // latest';

}
