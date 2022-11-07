{

  inputs.packument.url   = "https://registry.npmjs.org/mdast-util-from-markdown?rev=26-928a66a252e13ca1c7e3113f5923aa47";
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
    ident = "mdast-util-from-markdown";
    ldir  = "info/unscoped/m/mdast-util-from-markdown";
    inherit packument fetchInfo;
  } // latest';

}
