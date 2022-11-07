{

  inputs.packument.url   = "https://registry.npmjs.org/jest-regex-util?rev=131-93b1aa542edafb50976bf8d87f3bf4ee";
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
    ident = "jest-regex-util";
    ldir  = "info/unscoped/j/jest-regex-util";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
