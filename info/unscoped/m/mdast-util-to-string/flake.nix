{

  inputs.packument.url   = "https://registry.npmjs.org/mdast-util-to-string?rev=20-54f495fd54024507e298ebb3ac4588ea";
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
    ident = "mdast-util-to-string";
    ldir  = "info/unscoped/m/mdast-util-to-string";
    inherit packument fetchInfo scope ident ldir;
  } // latest';

}
