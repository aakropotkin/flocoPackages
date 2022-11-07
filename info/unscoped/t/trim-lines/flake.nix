{

  inputs.packument.url   = "https://registry.npmjs.org/trim-lines?rev=11-e1fce144019dd38c94389d5994226bd0";
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
    ident = "trim-lines";
    ldir  = "info/unscoped/t/trim-lines";
    inherit packument fetchInfo;
  } // latest';

}
