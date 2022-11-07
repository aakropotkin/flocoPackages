{

  inputs.packument.url   = "https://registry.npmjs.org/repeat-string?rev=38-a12ce004075a90af096865b2fd5cb2f6";
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
    ident = "repeat-string";
    ldir  = "info/unscoped/r/repeat-string";
    inherit packument fetchInfo;
  } // latest';

}
