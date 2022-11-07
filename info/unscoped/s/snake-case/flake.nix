{

  inputs.packument.url   = "https://registry.npmjs.org/snake-case?rev=36-82e957c2a251a3352f9daa4cb0d4e65b";
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
    ident = "snake-case";
    ldir  = "info/unscoped/s/snake-case";
    inherit packument fetchInfo;
  } // latest';

}
